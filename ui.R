pageWithSidebar(
  headerPanel('Run K-means on Clustering Scores Dataset'),
  sidebarPanel(
    selectInput('xcol', 'X Variable', names(scores)),
    selectInput('ycol', 'Y Variable', names(scores),
                selected=names(scores)[[2]]),
    numericInput('clusters', 'Cluster count', 1,
                 min = 1, max = 20)
  ),
  mainPanel(
    plotOutput('plot1')
  )
)