import Vue from 'vue';
import App from './App.vue';

Vue.config.productionTip = false;
Vue.config.devtools = true;

Vue.filter('capitalize', function (value) {
  if (!value) {
    return ''
  }
  value = value.toString();
  return value.charAt(0).toUpperCase() + value.slice(1).toLowerCase();
});

new Vue({
  render: h => h(App),
}).$mount('#app');
