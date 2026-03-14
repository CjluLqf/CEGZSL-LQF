## Plan: 中断可恢复的单条最佳记录

### 将要修改的文件路径
- /home/st/pytorch/lqf/CEGZSL-LQF/plan.md
- /home/st/pytorch/lqf/CEGZSL-LQF/CE_GZSL.py

### 目标
- 每次运行仅追加 1 条最终最佳 H 记录。
- 即使 Ctrl+C 中断，也能写入当前最佳 H 对应的 S/U/epoch。
- S/U 必须是最佳 H 发生时对应值，而非全程独立最优。

### 实施步骤
1. 保留运行级缓存变量 best_H、best_S、best_U、best_epoch，并仅在 H 刷新时更新它们。
2. 将训练主循环包裹到 try/except KeyboardInterrupt/finally 中。
3. 删除循环内任何 CSV 追加写入。
4. 在 finally 中统一执行一次写入：if best_epoch > 0: append_history_on_new_best(best_epoch, best_S, best_U, best_H)。
5. 保留 best_H_summary.pth 的轻量覆盖保存，字段与当前最佳缓存一致。

### 验证
1. 正常运行一次，CSV 仅新增 1 行。
2. 中断运行一次，CSV 仍新增 1 行（若本次已出现最佳 H）。
3. CSV 与 best_H_summary.pth 的 S/U/H/epoch 完全一致。
