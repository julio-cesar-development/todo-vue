<template>
	<div class="task-grid">
		<template v-if="tasks && tasks.length">
      <task v-for="(task, idx) in tasks"
        v-bind:task="task"
        v-bind:key="task.name"
        v-on:task-deleted="deleteTask(idx)"
        v-on:task-state-changed="changeTaskState(idx)"
      />
    </template>
    <template v-else>
      <div>
        <p class="no-task">Nenhuma task 😀</p>
      </div>
    </template>
	</div>
</template>

<script>
import Task from '@/components/Task';

export default {
  name: 'TaskGrid',
  components: {
    Task,
  },
  directives: {},
  filters: {},
  mixins: [],
  props: {
    tasks: {
      type: Array,
      required: true,
    }
  },
  data() {
    return {

    }
  },
  computed: {

  },
  watch: {},
  beforeCreate() {},
  created() {},
  beforeMount() {},
  mounted() {

  },
  beforeUpdate() {},
  updated() {},
  activated() {},
  deactivated() {},
  beforeDestroy() {},
  destroyed() {},
  methods: {
    deleteTask(index) {
      console.log(index); // eslint-disable-line
      this.$emit('task-deleted', index);

      // if (task.name) {
      //   const idx = this.tasks.findIndex(t => t.name === task.name);
      //   // const idx = this.tasks.indexOf(task);

      //   // mutating 'tasks' directly
      //   const tasksNew = [];
      //   this.tasks.forEach((t, i) => {
      //     if (i !== idx) {
      //       tasksNew.push(t);
      //     }
      //   })
      //   // console.log(tasksNew); // eslint-disable-line
      //   // this.tasks = tasksNew;

      //   // this.tasks.splice(idx, 1);

      //   this.$emit('task-deleted', idx);
      // }
    },
    changeTaskState(index) {
      this.$emit('task-state-changed', index);
    },
  },
}
</script>

<style scoped>
.task-grid {
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  flex-wrap: wrap;
  padding: 10px;
}

.task-grid .task {
  margin: 10px;
}

.no-task {
  color: #bbb;
  font-size: 1.8em;
}
</style>
