运行需要先执行init.sql
然后配置zookeeper 地址 先便宜启动rpc-service
再在web-server配置中修改zookeeper和redis配置和地址 再用Bootstrap启动 idea直接启动需要将working directory改为$MODULE_DIR$