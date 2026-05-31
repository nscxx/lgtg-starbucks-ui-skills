---
name: admin-ui-redesign
description: >-
  Generic Vue 2 + Element UI admin page redesign workflow: mockup-first, template/style
  only, shared layout classes and table patterns. Theme-agnostic (colors come from a
  separate theme skill). Use with deep-green-theme or another theme skill when the
  user asks to redesign, 换皮, 改版, mockup, or restyle admin pages.
disable-model-invocation: true
---

# Admin UI 改版 — 通用 Skill（与配色无关）

> 本 Skill 只规定**流程、结构、组件用法**，不写具体 hex 色值。  
> 配色：配合 **主题 Skill**（默认深绿 → `deep-green-theme`）。

## 你怎么用（给用户）

```
请按 admin-ui-redesign + deep-green-theme 改版 src/views/xxx/Page.vue
```

仅改流程时，可只 @ `admin-ui-redesign`。

---

## 前置：加载主题 Skill

| 场景 | 读取 |
|---|---|
| 深绿色财务风（默认） | [deep-green-theme/SKILL.md](../deep-green-theme/SKILL.md) + [tokens.md](../deep-green-theme/tokens.md) |
| 其他 SaaS 配色 | 对应的 `xxx-theme` Skill（从 deep-green-theme 复制改 token） |

改 Vue 前确认工作区已有 `src/styles/design-tokens.scss`（或主题 Skill 里的接入说明）。

---

## 技术前提

- Vue 2.x + Element UI 2.x + vue-element-admin 类脚手架
- 国际化：`$t('...')` 不删 key
- 字体：`@fontsource/*` 本地打包，不用 Google CDN
- **不用 Tailwind**
- 用户可能非工程师：通俗中文；改前备份；不主动 git commit

---

## 核心原则（与颜色无关）

1. **品牌色 vs 状态色**（具体 hex 见主题 tokens）
   - 品牌/accent：链接、复选框、accent 主操作
   - 主查询按钮：深灰系（`btn-page--primary`），**不是 Element 默认绿**
   - 状态四色语义区分，禁止全部改成品牌色

2. **逻辑禁区**：只改 `<template>` + `<style>`
   - 例外：纯展示 `computed` / `method`（如 `enabledCount`、`statusDotClass`）须说明且不改 API

3. **色值只写 CSS 变量** `var(--accent)` 等，页面内禁止写死 hex

---

## 标准工作流

```
[ ] 1. 读目标 .vue（结构、字段、子组件）
[ ] 2. 读主题 Skill 的 tokens
[ ] 3. 判断页面类型 A/B/C/D（见 reference-layout.md）
[ ] 4. 项目根创建 [PageName]-mockup.html（:root 从主题 tokens 复制）
[ ] 5. 告知用户，等待「可以」——未确认禁止改 Vue
[ ] 6. 备份：Page.vue → Page.vue.备份
[ ] 7. 改 template/style；根节点 `[page]-page finance-page`
[ ] 8. @import 主题 design-pack 中的 finance-page-common.scss（若有）
[ ] 9. 构建验证（如 npm run build:prod）
[ ] 10. 说明如何刷新查看
```

---

## Vue 结构要点

```html
<div class="customer-page finance-page">
  <div class="page-head">…</div>
  <div class="stats">…</div>
  <div class="filterbar">…</div>
  <div class="table-wrap">…</div>
</div>
```

```scss
<style scoped lang="scss">
@import '@/styles/finance-page-common.scss';
</style>
```

### 按钮 class 语义

| class | 用途 |
|---|---|
| `btn-page btn-page--default` | 重置、刷新 |
| `btn-page btn-page--primary` | 查询（深灰） |
| `btn-accent` | 工具栏品牌色主操作 |
| `btn-ghost` | 行内描边操作 |

### 状态

圆点 + 文字：`status-dot is-success | is-warn | is-info | is-danger`

### 已验证的交互模式

- **联系人**：列内仅姓名，`el-popover` 展开详情
- **行首展开资质**：**两列 grid**，营业执照 `grid-column: 1 / -1`
- **操作列**：主操作 + `el-dropdown`（···）收纳次要项

---

## Mockup 要求

- 独立 HTML，项目根 `[Name]-mockup.html`
- 顶部说明条 + 主题 `:root`
- 外壳 `#2a2a28` 仅预览；系统内用 `--bg`
- class 名与 Vue 一致

---

## 验收清单

- [ ] 已读主题 Skill
- [ ] mockup 已确认
- [ ] `.vue.备份` 存在
- [ ] 仅 template/style（或已批准展示逻辑）
- [ ] 无散落写死 hex
- [ ] 构建通过

---

## 延伸阅读

- [reference-layout.md](reference-layout.md) — DOM 骨架、页面类型、穿透模板
