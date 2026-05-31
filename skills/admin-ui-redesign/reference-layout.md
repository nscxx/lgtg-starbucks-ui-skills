# 布局与组件参考 — admin-ui-redesign（无配色）

---

## 页面类型

| 类型 | 结构 | 范本（lgtg 仓库内路径） |
|---|---|---|
| **A** 标准列表 | page-head + stats×4 + filterbar + table-wrap | `billPage.vue`, `customer/index.vue` |
| **B** 三栏 | 同上 + workspace 三栏 240/360/flex | `supplierBillPage.vue` |
| **C** 仪表盘 | KPI 网格 + 图表/多表 | `dashboard-mockup.html` |
| **D** 其他 | mockup-first，沿用 class 语义 | — |

---

## 类型 A DOM

```html
<div class="[page]-page finance-page">
  <div class="page-head">
    <h1 class="page-title">标题</h1>
    <div class="page-meta">…</div>
    <div class="page-actions">…</div>
  </div>
  <div class="stats"><div class="stat">…</div></div>
  <div class="filterbar">
    <el-form class="filter-form" inline>
      <el-form-item class="filter-actions">
        <el-button class="btn-page btn-page--default">重置</el-button>
        <el-button type="primary" class="btn-page btn-page--primary">查询</el-button>
      </el-form-item>
    </el-form>
  </div>
  <div class="table-wrap">
    <div class="table-toolbar">…</div>
    <el-table class="…-table">…</el-table>
    <div class="pagination-wrap">…</div>
  </div>
</div>
```

---

## 行首展开（两列）

```scss
.qual-expand-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 8px 24px;
}
.qual-item label { display: block; font-size: 11px; margin-bottom: 2px; }
.qual-item--full { grid-column: 1 / -1; padding-top: 12px; border-top: 1px solid var(--border); }
```

---

## 类型 B 三栏

```scss
.three-level-container { display: flex; border: 1px solid var(--border); border-radius: var(--radius-lg); overflow: hidden; }
.left-panel { width: 240px; border-right: 1px solid var(--border); }
.middle-panel { width: 360px; border-right: 1px solid var(--border); }
.right-panel { flex: 1; min-width: 0; }
```

---

## 表格穿透模板

```scss
#app .your-page-class {
  .el-table th.el-table__cell {
    background: var(--surface-2) !important;
    border-bottom: 1px solid var(--border) !important;
    border-right: none !important;
  }
  .el-table td.el-table__cell {
    border-bottom: 1px solid var(--border) !important;
    border-right: none !important;
  }
  .el-checkbox__input.is-checked .el-checkbox__inner {
    background-color: var(--accent) !important;
    border-color: var(--accent) !important;
  }
}
```

---

## 表格列对齐

- 文字/名称：`align="left"`
- 金额/数量：`align="right"` + `var(--font-num)`
- 去掉 `stripe`、多余 `border`

---

## Mockup 外壳

```html
<body style="background:#2a2a28;padding:16px;">
  <div class="mockup-banner">…</div>
  <div class="page" style="background:var(--bg);max-width:1280px;margin:0 auto;">…</div>
</body>
```

`:root` 从**主题 Skill 的 tokens.md** 复制，不要在此文件写 hex。

---

## 备份命令

```powershell
Copy-Item "src\views\path\Page.vue" "src\views\path\Page.vue.备份"
npm run build:prod
```
