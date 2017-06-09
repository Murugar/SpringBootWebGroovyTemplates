html {
  head {
    title(title)
    link(rel:'stylesheet', href:'/css/bootstrap.css')
  }
  body {
    div(class:'container-fluid') {
      div(class:'navbar navbar-default') {
        div(class:'navbar-header') {
          a(class:'navbar-brand',
              href:'/') {
              yield 'Groovy - Layout'
          }
          ul(class:'nav navbar-nav') {
            li(class:'active') {
              a(href:'/') {
                yield 'Messages'
              }
            }
          }
        }
      }
      h1(title, class:'text-danger')
      div { content() }
    }
  }
}
