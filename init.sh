#!/bin/bash

# 检查参数个数
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <type> <project_name>"
    echo "Type can be: Frontend, Midend, Backend"
    exit 1
fi

# 读取输入参数
TYPE=$1
PROJECT_NAME=$2

# 定义GitHub仓库的基础URL
REPO_BASE_URL="https://github.com/shirohasuki"

# 定义仓库映射关系
declare -A REPOSITORY=(
    [Frontend]="Transformer pytorch"
    [Midend]="RVCC"
    [Backend]="ml-accelerator"
)

# 检查类别是否有效
if [ -z "${REPOSITORY[$TYPE]}" ]; then
    echo "Invalid type. Please choose from Frontend, Midend, or Backend."
    exit 1
fi

# 检查项目是否有效
IFS=$'\n' # 更新IFS以换行符作为内部字段分隔符
projects=($(echo ${REPOSITORY[$TYPE]} | tr ' ' '\n')) # 将项目名称按空格分割成数组
unset IFS # 重置IFS

if ! [[ " ${projects[*]} " =~ " ${PROJECT_NAME} " ]]; then
    echo "Invalid project name for the selected type."
    exit 1
fi

# 构建完整的仓库URL
REPO_URL="${REPO_BASE_URL}/${PROJECT_NAME}.git"

# 克隆仓库
echo "Cloning repository from $REPO_URL ..."
git clone $REPO_URL "$TYPE/$PROJECT_NAME"

# 进入项目目录
cd "$TYPE/$PROJECT_NAME" || exit

# 检查配置脚本是否存在并执行
CONFIG_SCRIPT="./setup.sh"

if [ -f "$CONFIG_SCRIPT" ]; then
    echo "Running configuration script..."
    chmod +x "$CONFIG_SCRIPT"  # 确保脚本可执行
    ./$CONFIG_SCRIPT
else
    echo "No configuration script found."
fi

# 脚本结束
echo "$TYPE-$PROJECT_NAME Init completed."