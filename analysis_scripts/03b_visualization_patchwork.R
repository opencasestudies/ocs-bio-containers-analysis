library(tidyverse)
library(ggplot2)
library(patchwork)
library(here)


hmdb_scatter <- table1_extract %>%
  mutate(longitudinal = factor(longitudinal, levels = c("No", "Yes"))) %>%
  ggplot(aes(x = num_paired_samples,
             y = hmdb_annotated_compounds,
             color = longitudinal,
             label = dataset_name)) +
  geom_point(size = 2.5) +
  geom_text(vjust = -0.5, size = 2.8, color = "black") +
  scale_color_manual(values = c("No" = "#D27D2D",
                                "Yes" = "#1D6F8A"), drop = FALSE) +
  labs(title = "Paired sample count vs HMDB annotation coverage",
       x = "No. samples with paired data",
       y = "HMDB Annotated compounds",
       color = "Longitudinal")  +
  theme_minimal(base_size = 12) +
  coord_fixed(ratio = 1)

kegg_scatter <- table1_extract %>%
  mutate(longitudinal = factor(longitudinal, levels = c("No", "Yes"))) %>%
  ggplot(aes(x = num_paired_samples,
             y = kegg_annotated_compounds,
             color = longitudinal,
             label = dataset_name)) +
  geom_point(size = 2.5) +
  geom_text(vjust = -0.5, size = 2.8, color = "black") +
  scale_color_manual(values = c("No" = "#D27D2D",
                                "Yes" = "#1D6F8A"), drop = FALSE) +
  labs(title = "Paired sample count vs KEGG annotation coverage",
       x = "No. samples with paired data",
       y = "KEGG Annotated compounds",
       color = "Longitudinal")  +
  theme_minimal(base_size = 12) +
  coord_fixed(ratio = 1)

hmdb_scatter + labs(title = NULL) +
  kegg_scatter +  labs(title = NULL) +
  plot_layout(guides = "collect") +
  plot_annotation(title = 'Paired sample count vs annotation coverage')

#save the plot
output_dir <- here::here("results", "plots")

if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE)
}

ggsave(here::here(paste0(output_dir, "combined_scatter.png")))
