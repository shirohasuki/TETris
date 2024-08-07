This is a full-stack hardware and software platform for machine learning tasks.

TETris is divided into three parts, front-end middle-end and back-end. Each component is decoupled from the other and inserted into this system. Here is a continuously updated list of optional sub-projects as follows.

| sub-project   | Type       |	discription |
|:--------      | :---------:|:--------     |
| Model_zoo     | Frontend   |              |
| Transformer   | Frontend   |              |
| RVCC          | Midend     |              |
| Buddy-MLIR    | Midend     |              |
| RV64_CPU      | Backend    |              |
| RVV_GPGPU     | Backend    |              |
| ml-accelerator| Backend    |              |

### Quick Start

Execute the init.sh script to initialize the corresponding repository

```
bash ./init.sh $Type $subproject_name
```

Example: bash ./init.sh Frontend Transformer 
