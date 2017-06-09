layout 'layout.tpl', title: 'Messages : View All',
  content: contents {
    div(class:'container-fluid') {
    
     div(class:'panel panel-primary') {
     
     div(class:'panel-heading', 'Messages')
     
     div(class:'panel-body') {
    
      div(class:'pull-left text-success') {
        a(href:'/?form', 'Create Message')
      }
      
      br()
      br()
      
      table(class:'table table-bordered table-striped') {
        thead {
          tr(class:'success text-danger') {
            td 'ID'
            td 'Created'
            td 'Summary'
          }
        }
        tbody {
          if (messages.empty) { tr { td(colspan:'3', 'No Messages' ) } }
          messages.each { message ->
            tr(class:'info text-primary') { 
              td message.id
              td "${message.created}"
              td {
                a(href:"/${message.id}") {
                  yield message.summary
                }
              }
            }
          }
        }
      }
    }
    }
    }
  }