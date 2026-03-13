## Plan: 仅在H刷新时记录S/U/H

### 将要修改的文件路径
- /home/st/pytorch/lqf/CEGZSL-LQF/plan.md
- /home/st/pytorch/lqf/CEGZSL-LQF/CE_GZSL.py

### 目标
- 仅当 H 出现更优时，记录当时的 S/U/H。
- 避免在程序退出时再写入可能引起歧义的记录。

### 实施步骤
1. 移除 atexit 触发的历史写入方式。
2. 新增“仅在 best_H 更新时写 CSV 一行”的函数调用。
3. 该行保存当前刷新时的 epoch、S、U、H 与关键配置。
4. 保留 best_H_summary.pth 的轻量保存，确保字段仍对应同一次 best 更新。

### 验证
1. 运行若干 epoch，确认 CSV 仅在 H 变大时新增行。
2. 检查每条新增行中的 S/U/H 与控制台该次 New best H 输出一致。
