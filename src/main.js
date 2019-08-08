import Vue from 'vue';
import App from '@/App.vue';
import capitalize from '@/utils/Capitalize';
import store from '@/store/index';

Vue.config.productionTip = false;
Vue.config.devtools = true;

Vue.filter('capitalize', capitalize);

new Vue({
  render: h => h(App),
  store,
}).$mount('#app');
