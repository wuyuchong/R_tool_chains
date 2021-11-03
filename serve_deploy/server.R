library(shiny)
library(reticulate)

use_virtualenv("r-reticulate") # importent: don't use anaconda here because it is unstable
model = import("src.convert")

options(shiny.maxRequestSize = 80*1024^2)

shinyServer(function(input, output) {

  output$contents <- renderText({

    if(is.null(input$upload)){
      return("上传图片后稍等片刻，识别结果将在此处显示。若此处输出空白，说明识别不到文字")
    }

    return(model$get_text(input$upload$datapath, input$type))

  })
})
