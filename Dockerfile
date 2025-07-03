# Use uma imagem Python oficial, leve e específica.
FROM python:3.13.5-alpine3.22

# Define variáveis de ambiente para garantir que os logs apareçam imediatamente.
ENV PYTHONUNBUFFERED=1

# Define o diretório de trabalho dentro do contêiner.
WORKDIR /app

# Copia o arquivo de dependências primeiro para aproveitar o cache do Docker.
# O Docker só reinstalará as dependências se o requirements.txt mudar.
COPY requirements.txt .

# Instala as dependências do projeto.
RUN pip install --no-cache-dir -r requirements.txt

# Copia todo o código da aplicação para o diretório de trabalho.
COPY . .

# Expõe a porta em que a aplicação será executada.
EXPOSE 8000

# Comando para iniciar a aplicação com Uvicorn.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]


