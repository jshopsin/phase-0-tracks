class TodoList
    attr_accessor :tasks

    def initialize (params = [])
        @tasks = params.push
    end

    def get_items
        @tasks
    end

    def add_item(task)
        @tasks << task
        @tasks
    end

    def delete_item(task)
        @tasks.delete(task)
        @tasks
    end

    def get_item(index)
        @tasks[index]
    end
end