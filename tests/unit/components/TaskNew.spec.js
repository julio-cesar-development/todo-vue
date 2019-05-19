import { shallowMount } from '@vue/test-utils';
import TaskNew from '@/components/TaskNew.vue';

describe('TaskNew.vue', () => {
  it('TaskNew.vue should match all specifications bellow', () => {
    const wrapper = shallowMount(TaskNew);
    expect(wrapper.isVueInstance()).toBeTruthy();

    expect(wrapper.classes('task-new')).toBe(true);

    expect(wrapper.contains('input[class="form-input"]')).toBe(true);

    expect(wrapper).toMatchSnapshot();
  });
});