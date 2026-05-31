# 深绿色主题 — 补充参考

配合 [SKILL.md](SKILL.md) 与 [admin-ui-redesign/reference-layout.md](../admin-ui-redesign/reference-layout.md)。

## 状态码示例（billPage）

| code | class |
|---|---|
| RECEIPT_BILL_CONFIRMED | is-success |
| RECEIPT_BILL_PENDING | is-warn |
| RECEIPT_BILL_REJECTED | is-danger |

## 操作列 ··· / 联系人 popover

见范本 `src/views/customer/index.vue` 或 admin-ui-redesign reference-layout。

## 常见漏网

| 现象 | 处理 |
|---|---|
| 查询按钮仍绿 | `btn-page--primary` + theme-override |
| 展开资质单列 | `grid-template-columns: 1fr 1fr` |
| 侧栏青色 | 搜 `#00[Dd]3[Cc]9` → token |
