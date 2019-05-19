import { shallowMount } from '@vue/test-utils';
import TaskProgressBar from '@/components/TaskProgressBar.vue';

describe('TaskProgressBar.vue', () => {
  it('TaskProgressBar.vue should match all specifications bellow', () => {
    const props = {
      progress: 50,
    };
    const wrapper = shallowMount(TaskProgressBar, {
      'propsData': props,
    });
    expect(wrapper.isVueInstance()).toBeTruthy();

    expect(wrapper.classes('task-progress')).toBe(true);

    expect(wrapper.contains('span[class="progress-value"]')).toBe(true);

    const progressBar = wrapper.find('.progress-bar');
    expect(progressBar.html()).toEqual(`<div class="progress-bar" style="width: ${props.progress}%;"></div>`);

    expect(wrapper).toMatchSnapshot();
  });
});