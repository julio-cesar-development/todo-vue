import Vue from 'vue';
import App from '@/App.vue';
import capitalize from '@/utils/Capitalize';
import store from '@/store/index';

Vue.config.productionTip = process.env.NODE_ENV === 'production' || false;
Vue.config.devtools = process.env.NODE_ENV !== 'production' || true;

Vue.filter('capitalize', capitalize);

new Vue({
  render: h => h(App),
  store,
}).$mount('#app');
