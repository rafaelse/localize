# Plataforma de Promoções

Sistema web de uma plataforma para cadastro e reserva de promoções. 
Versão inicialmente prototípica.

## Como rodar a aplicação

### Requerimentos

 - [Docker](https://docs.docker.com/engine/install/)
 - [Docker Compose](https://docs.docker.com/compose/install/)

### Inicialização

 1. Crie um arquivo com o nome `.env` e o conteúdo:

    ```
    POSTGRES_USER=<usuario>
    POSTGRES_PASSWORD=<senha>
    POSTGRES_DB=<senha>
    ```

    **Substituir o conteúdo entre <>**


 2. Rode o comando `docker compose up -d --build`

 3. Acesse a aplicação no endereço [http:/localhost:3000](http://localhost:3000)

 4. Para pausar a aplicação, rode o comando `docker compose down`

**Nota**: Esses comandos devem ser rodados na raiz do projeto
