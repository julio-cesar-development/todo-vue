import { shallowMount } from '@vue/test-utils';
import Task from '@/components/Task.vue';

describe('Task.vue', () => {
  it('Task.vue should match all specifications bellow', () => {
    const props = {
      task: {
        name: 'Test 01',
        pending: false,
      },
    };
    const wrapper = shallowMount(Task, {
      'propsData': props,
    });
    expect(wrapper.isVueInstance()).toBeTruthy();

    expect(wrapper.classes('done')).toBe(true);

    expect(wrapper.contains('div[class*="task"]')).toBe(true);
    expect(wrapper.contains('label[class="task-label"]')).toBe(true);

    const labelTask = wrapper.find('.task-label');
    expect(labelTask.html()).toEqual(`<label class="task-label">${props.task.name}</label>`);

    expect(wrapper).toMatchSnapshot();
  });
});