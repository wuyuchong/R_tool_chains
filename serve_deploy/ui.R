library(shiny)

# Define UI for application that plots random distributions 
shinyUI(fluidPage(

  # App title ----
  titlePanel("图片文字识别"),

  # Sidebar layout with input and output definitions ----
  sidebarLayout(

    # Sidebar panel for inputs ----
    sidebarPanel(

      # Horizontal line ----
      tags$hr(),

      # Input: Select separator ----
      radioButtons("type", "识别类型",
                   choices = c(文字识别 = "text",
                               手写识别 = "handwrite",
                               数字识别 = "number"),
                   selected = "text"),

      # Horizontal line ----
      tags$hr(),

      # Input: Select a file ----
      fileInput("upload", "选择文件 或 拖拽文件至框内",
                multiple = FALSE,
                accept = c(".png", ".jpeg", ".jpg", ".bmp")),

      # Horizontal line ----
      tags$hr(),

      # Input: Select number of rows to display ----
      helpText("支持的图片格式：png jpg jpeg bmp"),
      helpText("图片大小不超过 80 MB"),

      # Horizontal line ----
      tags$hr(),

      # Input: Select number of rows to display ----
      helpText("此页面为统计软件课堂展示"),
      helpText("指导老师：杨玥含"),
      helpText("项目地址："),
      helpText("http://wuyuchong.com/blogs/R_tool_chains"),

      # Horizontal line ----
      tags$hr()

    ),

    # Main panel for displaying outputs ----
    mainPanel(

      # Output: Data file ----
      textOutput("contents")

    )

  )
))
