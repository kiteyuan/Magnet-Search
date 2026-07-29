# 纸鸢磁力桌面 / Android（Tauri 2 网页壳）

最小 Tauri 2 应用：启动后全窗口（或全屏 WebView）加载线上站点 [https://magnet.kiteyuan.info](https://magnet.kiteyuan.info)，无地址栏。

## 环境要求

- [Node.js](https://nodejs.org/) LTS（建议 20+）
- [Rust](https://www.rust-lang.org/tools/install) stable
- 各平台系统依赖见 [Tauri 前提条件](https://v2.tauri.app/start/prerequisites/)
  - Windows：WebView2（一般已预装）
  - macOS：Xcode Command Line Tools
  - Linux：`webkit2gtk` 等
  - Android（可选本地构建）：Android Studio / SDK + NDK，并设置 `ANDROID_HOME`、`NDK_HOME`

## 本地开发（桌面）

```bash
cd desktop
npm install
npm run dev
```

开发与正式包均直接打开 `https://magnet.kiteyuan.info`（见 `src-tauri/tauri.conf.json`）。

## 本地打包（桌面）

```bash
cd desktop
npm run build
```

产物目录：`desktop/src-tauri/target/release/bundle/`

| 平台 | 常见产物 |
|------|----------|
| Windows | `nsis/`（`.exe`；中文应用名下暂不打 MSI） |
| macOS | `dmg/`、`macos/` |
| Linux | `appimage/`、`deb/` |

## Android

日常发版靠 GitHub Actions；本机没有 SDK 也可以不装。若本机要调试：

```bash
cd desktop
# 安装 Android Studio，配置 ANDROID_HOME / NDK_HOME 后：
npm run android:init
npm run android:dev
# 打包 APK：
npm run android:build
```

CI 会在 runner 上自动 `tauri android init` 并产出 **aarch64 debug 签名 APK**（可侧载安装）。Play 商店正式签名后续再配 secrets。

## 配置要点

- **远程 URL**：`frontendDist` / `devUrl` / `windows[0].url` → `https://magnet.kiteyuan.info`
- **CSP**：允许 `magnet.kiteyuan.info` 与 `*.kiteyuan.info`
- **Capabilities**：`src-tauri/capabilities/default.json` 中 `remote.urls` 已放行该域名
- **窗口**：桌面默认 `1200x800`，可调整大小

本地 `src/index.html` 仅为占位；**不会**把整站离线打进安装包。

## CI 发布（GitHub Actions）

工作流：`.github/workflows/release.yml`

**触发方式**

1. 推送版本 tag：

```bash
git tag v0.1.1
git push origin v0.1.1
```

2. 或在 GitHub Actions 页手动 `workflow_dispatch`

**矩阵**

| Runner | 说明 |
|--------|------|
| `windows-latest` | Windows 安装包 |
| `ubuntu-22.04` | Linux |
| `macos-latest` | Apple Silicon + Intel |
| `ubuntu-latest` | Android APK（`tauri android`，aarch64 debug） |

产物上传到 **GitHub Release**（正式发布，非 draft）。

仓库需允许 Actions 写入：Settings → Actions → General → Workflow permissions → **Read and write permissions**。

## 签名 / 公证 / 上架（后续可选）

当前**未**配置：

- Apple Developer 公证
- Windows 代码签名
- Android Play 商店上传密钥（见 [Android 签名](https://v2.tauri.app/distribute/sign/android/)）

## 目录结构

```
desktop/
  package.json
  src/                 # 本地占位页
  src-tauri/
    tauri.conf.json
    capabilities/
    icons/
    src/
.github/workflows/
  release.yml          # Win / macOS / Linux / Android 发版
```
