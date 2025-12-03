
# Análise simples de desempenho escolar


# Carregar bibliotecas
library(ggplot2)

# Criar dados simulados de notas
set.seed(42)
alunos <- data.frame(
  nome = paste("Aluno", 1:30),
  matematica = round(rnorm(30, mean = 7, sd = 1.5), 1),
  portugues = round(rnorm(30, mean = 7.5, sd = 1.3), 1),
  ciencias = round(rnorm(30, mean = 6.8, sd = 1.4), 1)
)

# Aqui garanto notas entre 0 e 10
alunos$matematica <- pmin(pmax(alunos$matematica, 0), 10)
alunos$portugues <- pmin(pmax(alunos$portugues, 0), 10)
alunos$ciencias <- pmin(pmax(alunos$ciencias, 0), 10)

# Calcular média geral
alunos$media <- round((alunos$matematica + alunos$portugues + alunos$ciencias) / 3, 1)

# Classificar status
alunos$status <- ifelse(alunos$media >= 7, "Aprovado", "Recuperação")


# ANÁLISES BÁSICAS


cat("=== ESTATÍSTICAS GERAIS ===\n")
cat("Média em Matemática:", round(mean(alunos$matematica), 2), "\n")
cat("Média em Português:", round(mean(alunos$portugues), 2), "\n")
cat("Média em Ciências:", round(mean(alunos$ciencias), 2), "\n")
cat("\nAprovados:", sum(alunos$status == "Aprovado"), "alunos\n")
cat("Recuperação:", sum(alunos$status == "Recuperação"), "alunos\n")


# VISUALIZAÇÕES


# Gráfico 1: Comparação de Médias por Disciplina
medias_disciplinas <- data.frame(
  disciplina = c("Matemática", "Português", "Ciências"),
  media = c(mean(alunos$matematica), mean(alunos$portugues), mean(alunos$ciencias))
)

ggplot(medias_disciplinas, aes(x = disciplina, y = media, fill = disciplina)) +
  geom_col() +
  geom_text(aes(label = round(media, 2)), vjust = -0.5, size = 5) +
  ylim(0, 10) +
  labs(title = "Média Geral por Disciplina",
       x = "Disciplina",
       y = "Nota Média") +
  theme_minimal() +
  theme(legend.position = "none")

# Gráfico 2: Distribuição dos Alunos
status_count <- table(alunos$status)

ggplot(data.frame(status_count), aes(x = Var1, y = Freq, fill = Var1)) +
  geom_col() +
  geom_text(aes(label = Freq), vjust = -0.5, size = 6) +
  labs(title = "Situação dos Alunos",
       x = "Status",
       y = "Quantidade") +
  theme_minimal() +
  theme(legend.position = "none")

# Gráfico 3: Top 5 Melhores Alunos
top5 <- head(alunos[order(-alunos$media), ], 5)

ggplot(top5, aes(x = reorder(nome, media), y = media)) +
  geom_col(fill = "steelblue") +
  geom_text(aes(label = media), hjust = -0.3) +
  coord_flip() +
  ylim(0, 10) +
  labs(title = "Top 5 Melhores Alunos",
       x = "Aluno",
       y = "Média Geral") +
  theme_minimal()

# Aqui salvo os resultados
write.csv(alunos, "resultados_alunos.csv", row.names = FALSE)
cat("\nDados salvos em 'resultados_alunos.csv'\n")