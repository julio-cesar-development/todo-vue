import { state } from './state';
import { actions } from './actions';
import { getters } from './getters';
import { mutations } from './mutations';

const namespaced = true;

const Tasks = {
  namespaced,
  state,
  actions,
  getters,
  mutations,
};

export default Tasks;
