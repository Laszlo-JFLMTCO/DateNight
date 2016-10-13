require_relative 'node'

    def compare(ref_node, new_node)
        return "left" if ref_node.value > new_node.value
        return "right" if ref_node.value < new_node.value
    end