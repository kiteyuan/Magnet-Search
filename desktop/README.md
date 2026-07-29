# Magnet 桌面端（Tauri 2 网页壳）

最小 Tauri 2 应用：启动后全窗口加载线上站点 [https://magnet.kiteyuan.info](https://magnet.kiteyuan.info)，无地址栏，体验接近普通网页浏览。

## 环境要求

- [Node.js](https://nodejs.org/) LTS（建议 20+）
- [Rust](https://www.rust-lang.org/tools/install) stable
- 各平台系统依赖见 [Tauri 前提条件](https://v2.tauri.app/start/prerequisites/)
  - Windows：WebView2（一般已预装）
  - macOS：Xcode Command Line Tools
  - Linux：`webkit2gtk` 等（Ubuntu 示例见下方 CI）

## 本地开发

```bash
cd desktop
npm install
npm run dev
```

开发与正式包均直接打开 `https://magnet.kiteyuan.info`（见 `src-tauri/tauri.conf.json` 的 `devUrl` / `frontendDist` / `windows[0].url`）。

## 本地打包

```bash
cd desktop
npm run build
```

产物目录：`desktop/src-tauri/target/release/bundle/`

| 平台 | 常见产物 |
|------|----------|
| Windows | `msi/`、`nsis/`（`.msi` / `.exe`） |
| macOS | `dmg/`、`macos/` |
| Linux | `appimage/`、`deb/` |

## 配置要点

- **远程 URL**：`frontendDist` / `devUrl` 指向 `https://magnet.kiteyuan.info`
- **CSP**：允许 `magnet.kiteyuan.info` 与 `*.kiteyuan.info` 相关资源（`tauri.conf.json` → `app.security.csp`）
- **Capabilities**：`src-tauri/capabilities/default.json` 中 `remote.urls` 已放行该域名，便于远程页使用 Tauri IPC（如 opener）
- **窗口**：默认 `1200x800`，可调整大小

本地 `src/index.html` 仅为占位说明；当前构建**不会**把整站离线打进安装包。

## CI 发布（GitHub Actions）

工作流：`.github/workflows/release.yml`

**触发方式**

1. 推送版本 tag（推荐）：

```bash
git tag v0.1.0
git push origin v0.1.0
```

2. 或在 GitHub Actions 页手动 `workflow_dispatch`

**矩阵**

| Runner | 说明 |
|--------|------|
| `windows-latest` | Windows 安装包 |
| `ubuntu-22.04` | Linux（安装 webkit2gtk 等依赖） |
| `macos-latest` | 分别产出 Apple Silicon（`aarch64-apple-darwin`）与 Intel（`x86_64-apple-darwin`） |

构建使用官方 [`tauri-apps/tauri-action`](https://github.com/tauri-apps/tauri-action)，产物上传到 **GitHub Release（draft）**。

仓库需允许 Actions 写入：Settings → Actions → General → Workflow permissions → **Read and write permissions**。

## 签名 / 公证（后续可选）

当前**未**配置：

- Apple Developer 公证（Notarization）
- Windows 代码签名证书

需要时在 workflow 中补充对应 secrets（如 `APPLE_CERTIFICATE`、`APPLE_ID`、`TAURI_SIGNING_*` 等），并参考 [Tauri 分发文档](https://v2.tauri.app/distribute/)。

## Android（可选，不阻塞桌面）

桌面交付不依赖 Android。若要扩展：

```bash
cd desktop
npm run tauri android init
npm run tauri android dev
```

## 目录结构

```
desktop/
  package.json
  src/                 # 本地占位页（默认未作为 frontendDist）
  src-tauri/
    tauri.conf.json    # 应用名、窗口、远程 URL、CSP、打包
    capabilities/      # 远程域名权限
    icons/             # 默认图标占位
    src/               # Rust 入口
.github/workflows/
  release.yml          # Win / macOS / Linux 自动发版
```
