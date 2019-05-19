import { shallowMount } from '@vue/test-utils';
import TaskGrid from '@/components/TaskGrid.vue';

describe('TaskGrid.vue', () => {
  it('TaskGrid.vue should match all specifications bellow', () => {
    const props = {
      tasks: [
        {
          name: 'Test 01',
          pending: false,
        },
        {
          name: 'Test 02',
          pending: true,
        },
      ],
    };
    const wrapper = shallowMount(TaskGrid, {
      'propsData': props,
    });
    expect(wrapper.isVueInstance()).toBeTruthy();

    expect(wrapper.classes('task-grid')).toBe(true);

    expect(wrapper.contains('div[class="no-task"]')).toBe(false);

    expect(wrapper).toMatchSnapshot();
  });

  it('TaskGrid.vue should contain a method deleteTask', () => {
    const idx = 1;
    const props = {
      tasks: [
        {
          name: 'Test 01',
          pending: false,
        },
        {
          name: 'Test 02',
          pending: true,
        },
      ],
    };
    const wrapper = shallowMount(TaskGrid, {
      'propsData': props,
    });
    expect(wrapper.isVueInstance()).toBeTruthy();

    wrapper.vm.$emit('task-deleted', idx);
    const emitted = wrapper.emitted();

    expect(emitted['task-deleted']).toBeTruthy()
    expect(emitted['task-deleted'].length).toBe(1)
    expect(emitted['task-deleted'][0]).toEqual([idx])

    expect(wrapper).toMatchSnapshot();
  });
});