# Проверка сетевых политик (namespace: np-task5)

## 1) Развёртывание сервисов
```bash
bash create-pods-services.sh
```

## 2) Применить политики
```bash
kubectl apply -f non-admin-api-allow.yaml
kubectl apply -f admin-api-allow.yaml
```

## 3) Позитивные проверки (должны **проходить**)
```bash
# как back-end-api → front-end  
kubectl -n np-task5 exec -it back-end-api-app -- bash -lc 'curl -s -o /dev/null -w "%{http_code}" http://front-end-app'

# как admin-back-end-api → admin-front-end 
kubectl -n np-task5 exec -it admin-back-end-api-app -- bash -lc 'curl -s -o /dev/null -w "%{http_code}" http://admin-front-end-app'
```

## 4) Негативные проверки (должны **НЕ проходить**)
```bash
# admin-back-end-api НЕ должен ходить к front-end 
kubectl -n np-task5 exec -it admin-back-end-api-app -- bash -lc 'curl -s -o /dev/null -w "%{http_code}" http://front-end-app'
# back-end-api НЕ должен ходить к admin-front-end
kubectl -n np-task5 exec -it back-end-api-app -- bash -lc 'curl -s -o /dev/null -w "%{http_code}" http://admin-front-end-app'

```
