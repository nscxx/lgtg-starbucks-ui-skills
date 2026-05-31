# 同事安装指南 — 深绿色主题改版 Skill

压缩包建议命名：`admin-ui-skill-bundle.zip`

---

## 发给同事什么？

| 内容 | 必须？ |
|------|--------|
| `skills/admin-ui-redesign/` | ✅ |
| `skills/deep-green-theme/` | ✅ |
| `design-pack/scss/` | 新项目接入 UI 时要 |
| `design-pack/mockups/` | 可选参考 |
| Vue / JS 业务源码 | ❌ 不必（有 git 或 Skill 路径即可） |

### 场景 A — 在已有仓库里改页（styles 已接入）

只装两个 Skill + git 权限。

### 场景 B — 新项目复用深绿 UI

再复制 `design-pack/scss/` + `main.js.snippet.txt`。

---

## 安装路径

```
~/.cursor/skills/admin-ui-redesign/
~/.cursor/skills/deep-green-theme/
```

装好后重启 Cursor。

---

## 对话用法

```
请按 admin-ui-redesign + deep-green-theme 改版 src/views/xxx/Page.vue
```

---

## 旧文件夹请删除

- `lgtg-finance-theme`（已改名为 deep-green-theme）
- `lgtg-finance-ui-redesign`（已拆分废弃）
