import Vue from 'vue';
import Vuex from 'vuex';
import Tasks from './modules/Tasks';

Vue.use(Vuex);

const store = new Vuex.Store({
  modules: {
    Tasks,
  },
});

export default store;
