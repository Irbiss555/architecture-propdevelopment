# Ролевая модель (сводная таблица)


| Роль (RBAC)           | Права роли (ключевые ресурсы)                                                                                                                                                                              | Группы/пользователи                                                                                                         |
| --------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `cluster-readonly`    | Чтение кластера: get/list/watch для `pods`, `deployments`, `services`, `ingresses`, `configmaps`, `events`, `nodes`, и т.д. Без доступа к `secrets`.                                                       | Аудиторы/аналитики **platform/auditor**                                                    |
| `cluster-operator`    | Настройка кластера: CRUD для основных ресурсных типов (workloads, ingress, HPA, NetworkPolicy, StorageClass, PDB, Namespaces). Без прав на `secrets`, RBAC и `nodes`.                                      | Платформа/SRE **platform/operator**                                                                      |
| `secrets-reader`      | Привилегированный доступ: чтение `secrets` (get/list/watch) по всему кластеру.                                                                                                                             | Безопасность (SecOps) **platform/secops**                                                                |
| `ns-developer` (Role) | Управление приложениями в **своём namespace**: CRUD для `deployments`, `pods` (включая exec/log), `services`, `ingresses`, `configmaps`, `jobs/cronjobs`, `HPA`, `NetworkPolicy`. Без доступа к `secrets`. | Команды разработки по доменам: **sales/dev-sales**, **utilities/dev-utilities**, **finance/dev-finance**, **data/dev-data** |


# Применение RBAC
```
kubectl apply -f namespaces.yaml
kubectl apply -f clusterroles.yaml
kubectl apply -f roles-namespaces.yaml
kubectl apply -f clusterrolebindings.yaml
kubectl apply -f rolebindings.yaml