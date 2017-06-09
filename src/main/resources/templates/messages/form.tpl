layout 'layout.tpl', title: 'Messages : Create',
  content: contents {
    div (class:'container-fluid') {
    
     div(class:'panel panel-primary') {
     
     div(class:'panel-heading', 'Create Message')
     
     div(class:'panel-body') {
    
    
      form (id:'messageForm', action:'/', method:'post', class:'form') {
      	if (formErrors) {
          div(class:'alert alert-error') {
            formErrors.each { error ->
              p error.defaultMessage
            }
          }
        }
        div (class:'pull-right text-danger') {
          a (href:'/', 'Messages')
        }
        label (for:'summary', 'Summary', class:'text-success form-group')
        input (name:'summary', type:'text', value:message.summary?:'',
            class:'form-control')
            
        br()    
            
        label (for:'text', 'Message', class:'text-success form-group')
        textarea (name:'text', class:'form-control', message.text?:'')
        
        br()
        
        div (class:'form-actions') {
          input (type:'submit', value:'Create',  class:'btn btn-primary btn-lg')
        }
      }
      }
      }
    }
  }