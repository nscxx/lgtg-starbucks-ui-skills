# lgtg-starbucks-ui-skills

一句话描述：本 UI Redesign Agent Skill 套装，可以将杂乱的后台管理系统前端界面，快速改造为美观典雅的星爸爸风格 UI。

❌️：旧版灵感通告 UI 样式过于丰富，部分交互不友好，手动逐页改造成本极高，容易引入 Bug。

✅️：本 Skill 沉淀了标准改造范式，只需简单调用，即可将旧代码转换为新 UI 规范代码，保留业务逻辑，仅重构视图层，效率提升 800%。

它会怎么做：先出 HTML 效果图确认，再只改 Vue 的 `<template>` / `<style>`，不碰业务逻辑。

本套装包含两个 Skill：


| Skill                                                      | 作用                                                    |
| ---------------------------------------------------------- | ----------------------------------------------------- |
| **[admin-ui-redesign](skills/admin-ui-redesign/SKILL.md)** | 通用改版流程（mockup-first、页面结构、按钮语义）— **与配色无关**             |
| **[deep-green-theme](skills/deep-green-theme/SKILL.md)**   | **深绿色主题** token + SCSS design-pack — 通用配色名，不绑定某个旧产品品牌 |


---

## 特性

- **Mockup-first**：先 `[PageName]-mockup.html`，你回复「可以」后再改 Vue
- **只改界面**：默认不动 `data` / `methods` / API
- **设计令牌**：颜色集中在 `design-tokens.scss`，页面用 `var(--accent)` 等变量
- **深绿财务风**：品牌 `#1B4332`、查询按钮深灰 `#1A1A18`、状态四色区分
- **可扩展**：复制 `deep-green-theme` 改 token 即可做新 SaaS 配色

---

## 适用技术栈

- Vue 2.x
- Element UI 2.x
- vue-element-admin 类脚手架（或同类后台）

---

## 快速安装

### 方式 1：一键脚本（推荐）

**Windows（PowerShell）：**

```powershell
git clone https://github.com/nscxx/lgtg-starbucks-ui-skills.git
cd lgtg-starbucks-ui-skills
.\scripts\install.ps1
```

**macOS / Linux：**

```bash
git clone https://github.com/nscxx/lgtg-starbucks-ui-skills.git
cd lgtg-starbucks-ui-skills
chmod +x scripts/install.sh
./scripts/install.sh
```

脚本会把 `skills/` 复制到：

```
~/.cursor/skills/admin-ui-redesign/
~/.cursor/skills/deep-green-theme/
```

安装后 **重启 Cursor** 或新开对话。

### 方式 2：手动复制

```text
本仓库 skills/admin-ui-redesign/  →  ~/.cursor/skills/admin-ui-redesign/
本仓库 skills/deep-green-theme/   →  ~/.cursor/skills/deep-green-theme/
```

---

## 在 Cursor/claude 里怎么用

在 Agent 对话输入：

```text
请按 admin-ui-redesign + deep-green-theme 改版 src/views/xxx/Page.vue
```

标准流程：

1. Agent 读取两个 Skill
2. 生成 `xxx-mockup.html`（浏览器打开确认）
3. 你回复 **「可以」**
4. Agent 备份 `.vue.备份`，只改 template/style
5. 跑构建验证（如 `npm run build:prod`）

---

## 仓库结构

```text
lgtg-starbucks-ui-skills/
├── README.md                 ← 本文件
├── LICENSE                   ← MIT
├── PUBLISHING.md             ← 维护者发布步骤
├── skills/
│   ├── admin-ui-redesign/    ← Cursor Skill（通用流程）
│   └── deep-green-theme/     ← Cursor Skill（深绿主题 + design-pack）
├── design-pack/
│   ├── scss/                 ← 6 个全局 SCSS（新项目接入 UI 时用）
│   ├── mockups/              ← HTML 效果图示例（可选参考）
│   └── main.js.snippet.txt   ← main.js 引入片段
└── scripts/
    ├── install.ps1
    └── install.sh
```

---

## 两种使用场景

### 场景 A：在已有项目里改页面（styles 已接入）

只需安装 **两个 Skill** + 项目 git 权限。

不必单独复制 scss / vue 源码；Agent 按 Skill 改当前仓库里的页面即可。

### 场景 B：在新 Vue 项目里复用深绿 UI

1. 安装两个 Skill（上节）
2. 复制 `design-pack/scss/` → 目标项目 `src/styles/`
3. 按 `design-pack/main.js.snippet.txt` 修改 `src/main.js`（顺序勿乱）
4. 安装字体：

```bash
npm install @fontsource/noto-sans-sc @fontsource/ibm-plex-sans @fontsource/ibm-plex-mono
```

1. 单页改版时在 Vue 中：

```scss
@import '@/styles/finance-page-common.scss';
```

详细说明见 [skills/deep-green-theme/INSTALL.md](skills/deep-green-theme/INSTALL.md)。

---

## 深绿色主题 — 色板速查


| 语义      | 变量          | 色值        |
| ------- | ----------- | --------- |
| 页面背景    | `--bg`      | `#F7F6F1` |
| 品牌 / 链接 | `--accent`  | `#1B4332` |
| 主按钮（查询） | `--text`    | `#1A1A18` |
| 成功      | `--success` | `#0F6E47` |
| 待处理     | `--warn`    | `#B7791F` |
| 信息      | `--info`    | `#1F5DAA` |
| 失败      | `--danger`  | `#B0291E` |


完整 token：[skills/deep-green-theme/tokens.md](skills/deep-green-theme/tokens.md)

**禁止回潮旧色：** `#00D3C9`（青） / `#67C23A`（Element 默认嫩绿）

---

## design-pack 包含的 SCSS


| 文件                             | 作用                             |
| ------------------------------ | ------------------------------ |
| `design-tokens.scss`           | CSS 变量（**改色主要改这里**）            |
| `element-variables.scss`       | Element UI 源头变量                |
| `layout-shell.scss`            | 侧栏 / 标签 / 内容区背景                |
| `finance-page-common.scss`     | 列表页共用布局 class                  |
| `finance-pages-overrides.scss` | 表格 / 复选框穿透                     |
| `theme-override.scss`          | Element 组件换皮（**main.js 最后引入**） |


`main.js` 引入顺序见 `design-pack/main.js.snippet.txt`。

---

## 发给同事什么？


| 内容                  | 场景 A 改页 | 场景 B 新项目 |
| ------------------- | ------- | -------- |
| 本 GitHub 仓库链接       | ✅       | ✅        |
| `design-pack/scss/` | 不必      | ✅        |
| Vue / JS 业务源码       | ❌       | ❌        |
| 单独 zip mockup       | 可选      | 可选       |


**一句话：** Skill 教 Agent **怎么改**；design-pack 让新项目 **能长出同样的皮**。

---

## 自定义其他配色

1. **不要**改 `admin-ui-redesign`
2. 复制 `skills/deep-green-theme/` → `skills/my-blue-theme/`（或 fork 后新建）
3. 只改 `tokens.md` + `design-pack/scss/design-tokens.scss`
4. 仍配合 `admin-ui-redesign` 使用

---

## Mockup 示例

`design-pack/mockups/` 内含：

- `billPage-mockup.html` — 标准列表页
- `supplierBillPage-mockup.html` — 三栏工作台
- `customerPage-mockup.html` — 联系人 popover + ··· 菜单

Mockup 外层深灰 `#2a2a28` 仅作预览；系统内背景为 `--bg`。

---

## 常见问题

**Q：Agent 没按 Skill 做？**  
A：对话里显式写 `admin-ui-redesign + deep-green-theme`；确认 Skill 已在 `~/.cursor/skills/` 且已重启 Cursor。

**Q：和旧名 `lgtg-finance-theme` 的关系？**  
A：已改名为 **deep-green-theme**，请删除旧 Skill 文件夹避免混淆。

**Q：能用于 Vue 3 吗？**  
A：流程可参考，但 class / Element 版本需自行调整，本仓库按 Vue 2 + Element UI 2 验证。

---

## 维护与发布

维护者发布新版本见 [PUBLISHING.md](PUBLISHING.md)。

---

## License

[nsc](LICENSE)
