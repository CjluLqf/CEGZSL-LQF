## Plan: 新增 SUN 训练与一键脚本

### 将要修改的文件路径
- /home/st/pytorch/lqf/CEGZSL-LQF/plan.md
- /home/st/pytorch/lqf/CEGZSL-LQF/CE_GZSL.py
- /home/st/pytorch/lqf/CEGZSL-LQF/README.md

### 将要新增的文件路径
- /home/st/pytorch/lqf/CEGZSL-LQF/run_sun.sh

### 目标
- 通过命令行参数在 CE_GZSL.py 内集成 SUN 训练/测试入口。
- 保持 CUB 默认参数与行为完全不变。
- 提供 SUN 一键脚本，后续直接运行脚本即可自动带入参数。

### 实施步骤
1. 在 CE_GZSL.py 中增加 dataset=SUN 的参数兜底逻辑，只覆盖 SUN 必需参数。
2. SUN 必需覆盖项：class_embedding=att、attSize=102、nclass_all=717、nclass_seen=645。
3. 保持“命令行显式传参优先”，如用户手动指定 attSize，则不使用兜底值。
4. 新增 run_sun.sh，封装 SUN 推荐启动命令，首版其余超参复用 CUB。
5. 更新 README.md，补充 SUN 用法与 run_sun.sh 说明。

### 验证
1. 运行 python CE_GZSL.py（无参数），确认仍是 CUB 默认值。
2. 运行 bash run_sun.sh，确认 SUN 必需参数生效。
3. 运行 python CE_GZSL.py --dataset SUN --attSize 120，确认用户显式参数优先。
