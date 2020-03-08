# DOCKER 宝塔面板 一键部署脚本

- 镜像默认使用 `Centos7` 基础镜像，使用 `Dockerfile` 构建

- 该脚本每次 `build` 的用户名和密码以及登录URL都不同，请使用 `docker-compose logs app` 查看默认信息

- 安装时间视网络环境而定，建议更换 `Docker` 的国内源

- 启动脚本是 `./DockerScript/init.sh`

- 配置文件 `.env` 中都有详细的注释

## 如何使用

> 注意，所有命令你应该在项目根目录下完成

1. 克隆目录到本地
```bash
git clone https://github.com/ifui/baota.git
```

2. 复制 `.env-example` 为 `.env`
```bash
cp .env-example .env
```

3. 运行容器
```bash
docker-compose up -d
```

4. 查看宝塔面板默认用户名、密码
```bash
docker-compose logs app
```

5. 打开浏览器，输入地址，开始享受

## 删除容器和数据卷

### 删除容器
```bash
docker-compose down
```
### 删除数据卷，请确认你需要执行此操作！
```bash
docker volume rm baota_app
```

## 关于作者
### ifui
邮箱：ifui@foxmail.com \
个人主页：[https://github.com/ifui](https://github.com/ifui) \
提交问题：[https://github.com/ifui/baota/issues](https://github.com/ifui/baota/issues)