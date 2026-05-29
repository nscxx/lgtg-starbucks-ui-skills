# 发布到 GitHub — 操作步骤（维护者用）

## 一、准备仓库

1. 在 GitHub 新建空仓库，建议名：`lgtg-starbucks-ui-skills`
2. 不要勾选「Add README」（本仓库自带）

## 二、只发布 lgtg-starbucks-ui-skills 这一层

本 Skill 包是独立目录，**不要**把整个 `lgtg_biz_admin` 业务仓库推上去。

### 方式 A：在本机单独建 git 仓库（推荐）

```powershell
cd D:\workspace\code\lgtg_biz_admin\lgtg-starbucks-ui-skills
git init
git add .
git commit -m "Initial release: admin-ui-redesign + deep-green-theme skills"
git branch -M main
git remote add origin https://github.com/nscxx/lgtg-starbucks-ui-skills.git
git push -u origin main
```

### 方式 B：GitHub 网页上传

1. 把 `lgtg-starbucks-ui-skills` 文件夹打成 zip
2. GitHub 仓库 → **Add file** → **Upload files**
3. 拖入解压后的全部内容（含 `skills/`、`design-pack/`、`README.md`）

## 三、发布前检查清单

- [ ] `README.md` 里仓库链接已改成你的 GitHub 地址
- [ ] `LICENSE` 版权年份 / 公司名是否需要改（当前为 MIT，Copyright 2026）
- [ ] 确认 zip 内**没有**业务源码、`.env`、密钥
- [ ] 本地跑一遍安装脚本：

```powershell
.\scripts\install.ps1
```

## 四、给同事发链接

发 GitHub 仓库地址 + README 里的「快速安装」即可，不必再发 zip。

## 五、后续更新版本

```powershell
git add .
git commit -m "docs: update tokens / mockup examples"
git tag v1.1.0
git push origin main --tags
```

在 GitHub **Releases** 里基于 tag 发 Release，附上变更说明。

## 六、可选：GitHub Release 附件

若同事内网无法 git clone，可在 Release 上传 `lgtg-starbucks-ui-skills-v1.0.0.zip`（与本目录内容一致）。
