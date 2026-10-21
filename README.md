# Cadê? 🔎
 
> Memória externa para objetos físicos: registre onde guardou e encontre depois, sem esforço.
 
## Sobre o projeto
 
Pessoas guardam objetos em lugares que fazem sentido na hora, mas esquecem onde. O resultado é tempo perdido, recompra e frustração.
 
O **Cadê?** é um aplicativo que resolve isso com um registro de baixíssimo esforço (foto ou voz) no momento de guardar e uma busca simples para achar o objeto depois.
 
## Público-alvo (personas)
 
Baseadas nas entrevistas com Claites, José e Ricardo.
 
| Persona | O que precisa |
|---|---|
| **Claites** | Foto do local e poucos passos para registrar e consultar |
| **José** | Uso offline, cadastro simples e permissões transparentes |
| **Ricardo** | App rápido (desiste em menos de 10 min) e com dados locais |
 
## Hipótese do MVP
 
> Se o usuário conseguir registrar um objeto em poucos toques e achá-lo depois com uma busca simples, ele confia no app e continua usando.
 
Isso ataca os principais riscos de adoção: cadastro trabalhoso e busca lenta.
 
## Funcionalidades
 
A jornada do usuário se organiza em cinco atividades:
 
- **Registrar:** foto do objeto, nome curto, local (texto e foto, reaproveitando locais já usados) e áudio.
- **Encontrar:** busca por texto com foto na primeira tela, filtro por local ou categoria.
- **Consultar:** detalhe do objeto com foto do item, foto do local, nome, data do registro e áudio.
- **Manter:** mudar o local, excluir objeto ou local e aviso de registro antigo.
- **Confiança:** uso offline com dados só no aparelho, permissões explicadas, compressão de mídia, backup manual e tutorial.
## Releases
 
| Release | Objetivo | Histórias | Critério de saída |
|---|---|---|---|
| **R1: Núcleo** | Fluxo registrar → buscar → ver, offline | US12, US13, US01, US02, US03, US05, US07 | Registrar em menos de 15 s; achar um item em até 3 toques; uso sem internet |
| **R2: MVP validado** | Cobrir o escopo do Canvas e reforçar a confiança | US04, US08, US06, US09, US10, US14, US15 | Testes com 5+ usuários, incluindo perfil não técnico; problemas críticos corrigidos |
| **R3: Evolução** | Manter registros vivos e ganhar escala | US11, US16, F01, F02 | Decidido com os dados de uso do MVP |
 
### Fora do escopo agora (pós-MVP)
 
- **F01:** reconhecimento de itens de uma foto de gaveta (visão computacional).
- **F02:** alertas inteligentes e compartilhamento familiar de registros.
## Backlog priorizado
 
Valor de 1 a 5, estimado pela recorrência nas entrevistas e nas dores do Canvas.
 
| ID | História | Épico | Valor | MoSCoW | Release |
|---|---|---|---|---|---|
| US01 | Registrar um objeto tirando uma foto | Registrar | 5 | Must | R1 |
| US02 | Dar um nome curto ao objeto | Registrar | 5 | Must | R1 |
| US03 | Informar onde guardei (texto e foto do local) | Registrar | 5 | Must | R1 |
| US04 | Registrar o local por áudio | Registrar | 4 | Should | R2 |
| US05 | Buscar por texto, com foto no resultado | Encontrar | 5 | Must | R1 |
| US06 | Filtrar por local ou categoria | Encontrar | 3 | Should | R2 |
| US07 | Ver o detalhe do objeto | Consultar | 5 | Must | R1 |
| US08 | Ouvir o áudio registrado | Consultar | 3 | Should | R2 |
| US09 | Mudar o local de um objeto | Manter | 4 | Should | R2 |
| US10 | Excluir objeto ou local | Manter | 2 | Should | R2 |
| US11 | Aviso de registro antigo | Manter | 3 | Could | R3 |
| US12 | Usar offline, com dados só no aparelho | Confiança | 5 | Must | R1 |
| US13 | Entender as permissões e poder negá-las sem travar o uso | Confiança | 4 | Must | R1 |
| US14 | Fotos e áudios comprimidos e espaço usado visível | Confiança | 3 | Should | R2 |
| US15 | Exportar/backup manual | Confiança | 3 | Should | R2 |
| US16 | Tutorial curto no primeiro uso | Confiança | 2 | Could | R3 |
| F01 | Visão computacional | Evolução | 4 | Won't (agora) | Pós-MVP |
| F02 | Alertas e compartilhamento familiar | Evolução | 3 | Won't (agora) | Pós-MVP |
 
## Dependências críticas
 
- **US12 (banco local offline)** é a base de tudo e deve ser a primeira entrega técnica.
- **US13 (permissões)** precede foto (US01) e áudio (US04).
- **US02 e US03 → US05 → US07:** a busca depende de dados cadastrados, e o detalhe depende da busca.
- **US14 (compressão)** deve vir antes do uso intenso de áudio, por causa do risco de armazenamento.
**Ordem de construção:** US12 → US13 → US01/US02 → US03 → US05 → US07 *(fim da R1)* → US14 → US04 → US08 → US06 → US09/US10 → US15 *(fim da R2)*.
 
## Roadmap
 
Premissa: 14 semanas, sprints de 2 semanas (ajustar ao calendário real). Os marcos 1 a 8 seguem os Milestones do Canvas.
 
| Semanas | Marcos | Entrega |
|---|---|---|
| 1–2 | 1 e 2 | Problema, público-alvo, entrevistas e ideação |
| 3–4 | 3 e 4 | Requisitos, backlog e protótipo das telas |
| 5–8 | 5 (parte 1) | Desenvolvimento da R1 e entrega interna |
| 9–11 | 5 (parte 2) | Desenvolvimento da R2 |
| 12–13 | 6 | Testes com usuários e avaliação de usabilidade |
| 14 | 7 e 8 | Correções e entrega da versão validada |
 
## Documentos relacionados
 
- Backlog, Story Map, MVP e Roadmap (artefato interativo)
- `Cade_Matriz_de_Riscos.xlsx`: riscos do projeto
## Equipe
 
Projeto desenvolvido em grupo. Itens marcados como *proposta* no backlog devem ser validados pelo grupo.