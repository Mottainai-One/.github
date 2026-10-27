<div align="center">

# .github — Mottainai-One

**Repositório reservado da organização Mottainai-One para configuração compartilhada do GitHub**

*Ponto central previsto para arquivos de saúde da comunidade, templates de issue e pull request e padrões de contribuição do ecossistema Mottainai.*

<br/>

[![GitHub](https://img.shields.io/badge/GitHub-Org%20config-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Mottainai-One/.github)
[![License](https://img.shields.io/badge/license-MIT-green?style=for-the-badge)](LICENSE)
[![Branch](https://img.shields.io/badge/branch%20padrão-main-blue?style=flat-square&logo=git&logoColor=white)](https://github.com/Mottainai-One/.github/tree/main)
[![Status](https://img.shields.io/badge/main-apenas%20README%20%2B%20LICENSE-lightgrey?style=flat-square)](#status-limitações-e-riscos)

<br/>

[Visão geral](#visão-geral) •
[Arquitetura](#arquitetura) •
[Conteúdo](#estrutura-do-repositório) •
[Branches](#trabalho-fora-da-main) •
[Como contribuir](#configuração-e-uso) •
[Segurança](#segurança-e-operação) •
[Status](#status-limitações-e-riscos) •
[Referências](#referências)

</div>

---

## Visão geral

| | |
|---|---|
| **Problema** | Cada repositório do Mottainai (APIs, frontend, mobiles, POS, BI, RPA, IA) precisaria repetir os mesmos templates e políticas de contribuição. |
| **Responsabilidade** | Guardar arquivos que o GitHub aplica como **padrão da organização** para repositórios que não têm versão própria. |
| **Consumidores** | Todos os repositórios públicos da org `Mottainai-One` e quem abre issues e PRs neles. |
| **Escopo** | Templates de PR/issue, `CONTRIBUTING`, `CODE_OF_CONDUCT`, `SECURITY`, `SUPPORT` e, futuramente, workflows reutilizáveis. |
| **Fora de escopo** | Código de aplicação, CI de projetos específicos e qualquer segredo da organização. |

> [!IMPORTANT]
> Na branch padrão `main`, **só existem `README.md` e `LICENSE`**. Nenhum template ou arquivo de comunidade está ativo hoje como padrão da organização. Os arquivos citados abaixo estão em outras branches e **não** foram mesclados na `main`.

---

## Arquitetura

O repositório não executa código. Ele funciona por convenção do GitHub: arquivos de saúde da comunidade colocados aqui passam a valer para os repositórios da org que **não** tenham o próprio arquivo equivalente.

```mermaid
flowchart TB
    subgraph ORG[".github (este repositório)"]
        direction LR
        T["pull_request_template.md"]
        H["CONTRIBUTING · CODE_OF_CONDUCT<br/>SECURITY · SUPPORT"]
        W["workflows reutilizáveis<br/>(não existe ainda)"]
    end

    subgraph REPOS["Repositórios da organização"]
        R1["Repo sem template próprio"]
        R2["Repo com template próprio<br/>(ex.: Api-SQL-Cliente, branch de CI)"]
    end

    T -. "fallback automático do GitHub" .-> R1
    H -. "fallback automático do GitHub" .-> R1
    R2 -->|"usa o arquivo local,<br/>ignora o da org"| R2
    W -. "precisa de chamada explícita<br/>via uses:" .-> REPOS

    style W stroke-dasharray: 5 5
```

| Tipo de arquivo | Comportamento esperado no GitHub | Status neste repo |
|---|---|---|
| Arquivos de saúde da comunidade | Herdados por repos sem versão própria | Não estão na `main` |
| Template de pull request | Herdado por repos sem template próprio | Só nas branches `develop`, `feature/pr-template` e `feature/render-test` |
| Workflows reutilizáveis | Não são herdados; o repo consumidor precisa chamá-los | Não existem |

<sub>O comportamento de herança é o documentado pelo GitHub para repositórios `.github` de organização. Ele não foi testado na prática nesta análise.</sub>

---

## Tecnologias

<table>
<tr>
<td align="center" width="140"><img src="https://cdn.simpleicons.org/github/181717" width="48" height="48" alt="GitHub"/><br/><b>GitHub</b><br/><sub>Community health files</sub></td>
<td align="center" width="140"><img src="https://cdn.simpleicons.org/markdown/000000" width="48" height="48" alt="Markdown"/><br/><b>Markdown</b><br/><sub>Templates e docs</sub></td>
<td align="center" width="140"><img src="https://cdn.simpleicons.org/powershell/5391FE" width="48" height="48" alt="PowerShell"/><br/><b>PowerShell</b><br/><sub><code>push.ps1</code><br/>(só na branch develop)</sub></td>
<td align="center" width="140"><img src="https://cdn.simpleicons.org/github/181717" width="48" height="48" alt="GitHub CLI"/><br/><b>GitHub CLI</b><br/><sub>Usado pelo <code>push.ps1</code></sub></td>
</tr>
</table>

---

## Estrutura do repositório

### Branch `main` (padrão)

```text
.github/
├── LICENSE        # MIT, Copyright (c) 2026 Mottainai-One
└── README.md      # Descrição de uma linha, em inglês
```

### Branch `develop` (não mesclada na `main`)

```text
.github/
├── CODE_OF_CONDUCT.md        # vazio (0 bytes)
├── CONTRIBUTING.md           # vazio (0 bytes)
├── SECURITY.md               # vazio (0 bytes)
├── SUPPORT.md                # vazio (0 bytes)
├── pull_request_template.md  # template de PR em inglês
├── push.ps1                  # git push + espera a PR aparecer via gh
├── render-test.txt           # arquivo de teste
├── LICENSE
└── README.md
```

---

## Trabalho fora da `main`

| Branch | Último commit | Conteúdo | PR |
|---|---|---|---|
| `develop` | 2026-08-04 | Arquivos de comunidade vazios, `pull_request_template.md`, `push.ps1`, `render-test.txt` | Recebeu as PRs #5 e #6 (mescladas em `develop`) |
| `feature/pr-template` | 2026-08-03 | Template de PR + arquivos de comunidade vazios | #5, mesclada em `develop` |
| `feature/render-test` | 2026-08-04 | Versão em inglês do template + `push.ps1` | #6, mesclada em `develop` |
| `docs/readme-standardization` | 2026-10-26 | README em português explicando o estado atual | #7, fechada sem merge e substituída pela documentação proposta |

<details>
<summary><b>O que o template de PR da branch <code>develop</code> pede</b></summary>

<br/>

Seções: **Description**, **Type of Change** (Feature, Bug Fix, Refactor, Documentation, Performance, Test, Chore), **Related Issue** (`Closes #`), **How to Test**, **Evidence** (opcional) e **Checklist**:

- Code reviewed
- Follows project standards
- No conflicts with `develop`
- Documentation updated (when necessary)
- Tested locally
- No secrets (.env, tokens, passwords)

</details>

<details>
<summary><b>O que o <code>push.ps1</code> faz</b></summary>

<br/>

1. Executa `git push` repassando os argumentos recebidos.
2. Descobre a branch atual e o `owner/repo` a partir do `remote.origin.url`.
3. Por até 30 tentativas, com 2 segundos de intervalo, consulta `gh pr list --head <branch> --state open`.
4. Quando encontra uma PR aberta, imprime a URL dela.

Ele não cria PR. Só espera que alguma automação (o `Mottainai-PR-Bot`, pelo histórico de commits) crie a PR e mostra o link.

</details>

---

## Configuração e uso

Não há build, dependência nem execução local. Para contribuir:

1. Clone o repositório:
   ```bash
   git clone https://github.com/Mottainai-One/.github.git
   ```
2. Adicione apenas arquivos que façam sentido para **vários** repositórios da organização.
3. Antes de contar com um arquivo como padrão, confira na [documentação do GitHub](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/creating-a-default-community-health-file) se o tipo de arquivo é herdado e se o repositório alvo não tem uma versão própria.

> [!NOTE]
> Para que os padrões tenham efeito, os arquivos precisam estar na **branch padrão** (`main`). Hoje eles estão só em `develop`.

---

## Testes e integração contínua

Não há workflows, testes ou gates neste repositório, em nenhuma das branches analisadas.

---

## Segurança e operação

| Tema | Situação observada |
|---|---|
| Segredos | Nenhum segredo encontrado nos arquivos da `main` e da `develop`. O template de PR pede que ninguém envie `.env`, tokens ou senhas. |
| `SECURITY.md` | Existe só na `develop`, e **vazio**. A org não tem canal documentado para reportar vulnerabilidades. |
| Histórico | O commit `dde8f1e` na `develop` tem a mensagem *"test PR creation after secret fix"*. Isso sugere um ajuste de segredo na automação de PRs. O conteúdo da correção não está neste repositório. |
| `push.ps1` | Depende do `gh` autenticado na máquina de quem roda. Não manipula credenciais diretamente. |

---

## Status, limitações e riscos

| Item | Status |
|---|:---:|
| README e LICENSE na `main` | ![ok](https://img.shields.io/badge/-pronto-success?style=flat-square) |
| Template de PR | ![branch](https://img.shields.io/badge/-só%20em%20develop-orange?style=flat-square) |
| CONTRIBUTING, CODE_OF_CONDUCT, SECURITY, SUPPORT | ![empty](https://img.shields.io/badge/-vazios%20em%20develop-red?style=flat-square) |
| Templates de issue | ![none](https://img.shields.io/badge/-não%20existem-lightgrey?style=flat-square) |
| Workflows reutilizáveis | ![none](https://img.shields.io/badge/-não%20existem-lightgrey?style=flat-square) |

> [!WARNING]
> **Riscos práticos**
> 1. **Arquivos vazios viram padrão da org.** Se `develop` for mesclada como está, todo repo sem arquivo próprio vai exibir `CONTRIBUTING`, `SECURITY` etc. **vazios**. Isso é pior que não ter nada.
> 2. **Templates divergentes.** O `Mottainai-Api-SQL-Cliente` tem um template de PR próprio, em português e com critérios cobrados pela CI, numa branch. O template daqui é em inglês e tem outro checklist. Sem alinhamento, cada repo segue um padrão diferente.
> 3. **Fluxo `develop` → `main` parado.** A `develop` recebeu PRs em agosto de 2026 e nunca foi promovida.
> 4. **`render-test.txt`** é um artefato de teste e não deveria ir para a `main`.

---

## Referências

- Repositório: <https://github.com/Mottainai-One/.github>
- PR #7 (README em português): <https://github.com/Mottainai-One/.github/pull/7>
- GitHub Docs: [Creating a default community health file](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/creating-a-default-community-health-file)
- GitHub Docs: [Reusing workflows](https://docs.github.com/en/actions/using-workflows/reusing-workflows)

---

<div align="center">

**Mottainai** · *menos desperdício, mais inteligência no estoque*

<sub>Parte do ecossistema <a href="https://github.com/Mottainai-One">Mottainai-One</a></sub>

</div>

---

<sub>**Rastreabilidade.** Análise em 2026-10-27, na `main` @ `33bda0e`. Arquivos consultados: `README.md` e `LICENSE` (`main`), `pull_request_template.md` e `push.ps1` (`develop` @ `dde8f1e`), `README.md` (`docs/readme-standardization` @ `7329418`), listagem de arquivos de todas as branches e lista de PRs pela API pública do GitHub.</sub>
