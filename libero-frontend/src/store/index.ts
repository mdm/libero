import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    language: null
  },
  getters: {
    language: state => {
      if (state.language !== null) {
        return state.language;
      }

      const language = window.navigator.language.slice(0, 2);

      // TODO: check if language is supported

      return language;
    }
  },
  mutations: {},
  actions: {},
  modules: {}
});
