# Desafio Final da Formação SRE da Elven Works
https://aprenda.elven.works/programa-de-formacao-sre

## Resumo do Trabalho:
Uma aplicação antiga (https://github.com/arfurlaneto/bootcamp-gostack11-gobarber) foi modernizada utilizando Cloud, IaC, Containers e Github Actions.

### Membros
- Antonio Furlaneto (https://github.com/arfurlaneto)
- Maria Clara (https://github.com/claramelo)
1- Ricardo Mendes (https://github.com/ricardobr001)

### Capítulos Abordados
- Cloud Platforms and Architecture
- Computer Networks
- Infrastructure as Code
- Pipelines de CI/CD
- Banco de Dados

# Aplicação
## Descrição
Desenvolvida durante um bootcamp da Rocketseat, se trata de um serviço para cabeleireiros, com módulo de gerenciamento web para os profissionais e um aplicativo de celular para o agendamento para os clientes.

## Componentes
### Backend
API do projeto, escrita em Node.JS. Serve de backend tanto para o frontend de gerenciamento quanto para o aplicativo mobile.

- *Postgres* - Storage principal para a aplicação, armazena todos os dados da agenda.
- *Mongo DB* - Utilizado para armazenar alguns tipos de dados menos importantes, como notificações enviadas para os usuários.
- *Redis* - Utilizado como mecanismos de cache para a aplicação.

### Frontend
Frontend do módulo de gerenciamento web. Escrito em React.JS. Permite que os profissionais gerenciem suas agendas.

### Mobile
Aplicativo de celular que permite que os clientes verifiquem a disponibilidade dos profissionais e façam agendamentos. Escrito em React Native.

# Aplicação
Detalhes de como executar a aplicação em [README.md](.infra/README.md).
