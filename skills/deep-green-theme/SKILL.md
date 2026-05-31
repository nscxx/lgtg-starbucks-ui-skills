---
name: deep-green-theme
description: >-
  Deep-green admin UI theme (#1B4332 accent, finance-style tokens). Generic palette name
  only — not tied to any legacy product brand. Use with admin-ui-redesign for Vue2+Element
  page restyling. Triggers: 深绿色主题, deep-green-theme, 深绿改版, design-tokens.
disable-model-invocation: true
---

# 深绿色主题 Skill

> **必须先读通用流程**：[admin-ui-redesign/SKILL.md](../admin-ui-redesign/SKILL.md)  
> **本文件只含**：配色 token、design-pack 接入、参考 mockup/页面路径。  
> **说明**：这是通用「深绿财务风」配色方案，**不是**某个旧系统的专属品牌色。

## 对话示例

> 请按 **admin-ui-redesign + deep-green-theme** 改版客户管理页

---

## 设计原则（深绿色主题）

| 角色 | 色值 | 变量 |
|---|---|---|
| 品牌/accent | `#1B4332` | `--accent` |
| 主按钮（查询） | `#1A1A18` | `--text` |
| 页面背景 | `#F7F6F1` | `--bg` |
| 成功 | `#0F6E47` | `--success` |
| 待处理 | `#B7791F` | `--warn` |
| 信息 | `#1F5DAA` | `--info` |
| 失败 | `#B0291E` | `--danger` |

**禁止回潮**：`#00D3C9` / `#E6FBFA` / `#67C23A`

完整 token 表：[tokens.md](tokens.md)

---

## 范本仓库路径（lgtg_biz_admin，仅作参考实现）

| 文件 | 作用 |
|---|---|
| `src/styles/design-tokens.scss` | 运行时色板（**改色只改此文件 :root**） |
| `src/styles/layout-shell.scss` | 侧栏/标签/内容区 |
| `src/styles/finance-page-common.scss` | 列表页布局 |
| `src/styles/finance-pages-overrides.scss` | 表格穿透 |
| `src/styles/theme-override.scss` | Element 换皮（main.js 最后引入） |
| `src/styles/element-variables.scss` | Element 变量源头 |

### main.js 样式顺序

```
element-ui css → index.scss → theme → element-variables
→ design-tokens → layout-shell → finance-pages-overrides → theme-override（最后）
```

### 参考 Vue（只读 template/style）

- `src/views/finance/pages/billPage.vue` — 类型 A
- `src/views/finance/pages/supplierBillPage.vue` — 类型 B
- `src/views/customer/index.vue` — 类型 A + popover + ···

### 参考 Mockup（项目根）

- `billPage-mockup.html` / `supplierBillPage-mockup.html` / `customerPage-mockup.html`

---

## 在新项目接入本主题

1. 复制 [design-pack/scss/](design-pack/scss/) 到目标项目 `src/styles/`
2. 按 [design-pack/main.js.snippet.txt](design-pack/main.js.snippet.txt) 改 `main.js`
3. 安装字体：`@fontsource/noto-sans-sc` `@fontsource/ibm-plex-sans` `@fontsource/ibm-plex-mono`

同事安装：[INSTALL.md](INSTALL.md)

---

## 换其他配色时

复制 `deep-green-theme` → 新主题文件夹，只改 `tokens.md` + `design-tokens.scss`，仍配合 `admin-ui-redesign`。
