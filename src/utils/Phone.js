export default {
  update (el) {
    let telEvent = el.value;
    telEvent = telEvent.replace(/\D+/g, '').trim();
    if(!telEvent) {
      el.value = '';
      return;
    }
    if(telEvent.length > 0){
      telEvent = `(${telEvent.substring(0)}`;
    }
    if(telEvent.length > 3){
      telEvent = `${telEvent.substring(0,3)})${telEvent.substring(3)}`;
    }
    if(telEvent.length > 8){
      if(telEvent.length <= 12){
        telEvent = `${telEvent.substring(0,8)}-${telEvent.substring(8,12)}`;
      }else {
        telEvent = `${telEvent.substring(0,9)}-${telEvent.substring(9,13)}`;
      }
    }
    el.value = telEvent;
  },
};
