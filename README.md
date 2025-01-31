# iac-aws-ecr

## 실행 
### 1. 테라폼 초기화 
```bash
terraform init
```

### 2. 구성 검증 
```bash
terraform validate
```

### 3. 실행 계획 생성 
```bash
terraform plan
```

- 계획을 파일로 저장하려면:
```bash
terraform plan -out=tfplan
```

### 4. 변경 사항 적용 
```bash
terraform apply
```

- 또는 저장된 계획을 사용:
```bash
terraform apply tfplan
```

- 자동 승인을 원한다면:
```bash
terraform apply -auto-approve
```

### 5. 상태 확인
```bash
terraform show
```

### 6. 리소스 삭제 
```bash
terraform destroy
```
- 특정 리소스만 삭제하려면 `-target` 옵션을 사용

