## Portfólio de Análise de Dados em R

Repositório com projetos de análise e processamento de dados desenvolvidos em R, para prática e mostrar habilidades em manipulação de dados, análise estatística e visualização.

---

## Sobre os Projetos

Este repositório contém três projetos práticos que demonstram diferentes aspectos da análise de dados:

### 1️⃣ **Análise de Notas de Alunos**
Análise de desempenho escolar com cálculo de médias e classificação de alunos.

**Técnicas utilizadas:**
- Manipulação de dataframes
- Cálculos estatísticos básicos
- Criação de novas variáveis
- Visualizações comparativas

**Principais insights:**
- Identificação de alunos com melhor desempenho
- Comparação entre disciplinas
- Taxa de aprovação vs recuperação

---

### 2️⃣ **Análise de Vendas Mensais**
Análise de desempenho comercial ao longo de 12 meses com múltiplos produtos.

**Técnicas utilizadas:**
- Análise de séries temporais simples
- Agregação de dados
- Transformação de dados (wide to long)
- Gráficos de linha e barras empilhadas

**Principais insights:**
- Evolução temporal das vendas
- Produto mais vendido
- Melhor e pior mês de vendas
- Composição do faturamento

---

### 3️⃣ **Análise de Perfil de Clientes**
Análise exploratória de base de clientes com segmentação e padrões de consumo.

**Técnicas utilizadas:**
- Análise exploratória de dados (EDA)
- Segmentação de clientes
- Análise de distribuições
- Correlação entre variáveis

**Principais insights:**
- Perfil demográfico dos clientes
- Distribuição geográfica
- Padrões de gasto por categoria
- Relação entre idade e consumo

---

## 🛠️ Tecnologias e Bibliotecas

- **R** (versão 4.0+)
- **ggplot2** - Visualizações
- **reshape2** - Transformação de dados

---

## 📁 Estrutura do Repositório

```
├── 01_analise_notas/
│   ├── analise_notas.R
│   ├── resultados_alunos.csv
│   └── README.md
│
├── 02_analise_vendas/
│   ├── analise_vendas.R
│   ├── vendas_mensais.csv
│   └── README.md
│
├── 03_analise_clientes/
│   ├── analise_clientes.R
│   ├── base_clientes.csv
│   └── README.md
│
└── README.md
```

---

## 🚀 Como Executar

### Pré-requisitos
```r
install.packages("ggplot2")
install.packages("reshape2")
```

### Executar os projetos
```r
# Navegue até a pasta do projeto desejado e execute:
source("analise_notas.R")
source("analise_vendas.R")
source("analise_clientes.R")
```

---

## 📈 Exemplos de Visualizações

Cada projeto gera visualizações profissionais que incluem:
- Gráficos de barras e colunas
- Gráficos de linha para séries temporais
- Histogramas de distribuição
- Gráficos de dispersão com linha de tendência
- Gráficos empilhados


---

## 📝 Observações

- Todos os dados utilizados são simulados para fins didáticos
- Os códigos são autocontidos e podem ser executados independentemente
- Cada script gera outputs visuais e exporta dados processados em CSV


