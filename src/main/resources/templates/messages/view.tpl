layout 'layout.tpl', title:'Messages : View',
  content: contents {
    div(class:'container-fluid') {
      
     div(class:'panel panel-primary') {
     
     div(class:'panel-heading', 'Create Message')
     
     div(class:'panel-body') {
    
      
      
      if (globalMessage) {
        div (class:'alert alert-success', globalMessage)
      }
      div(class:'pull-right') {
        a(href:'/', 'Messages')
      }
      dl {
        dt 'ID'
        dd(id:'id', message.id, class:'text-warning')
        dt 'Date'
        dd(id:'created', "${message.created}", class:'text-primary')
        dt 'Summary'
        dd(id:'summary', message.summary, class:'text-success')
        dt 'Message'
        dd(id:'text', message.text, class:'text-info')
      }
    }
   }
   }
  }