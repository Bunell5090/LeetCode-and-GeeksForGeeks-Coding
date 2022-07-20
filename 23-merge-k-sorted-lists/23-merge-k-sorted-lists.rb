# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode[]} lists
# @return {ListNode}

def merge_k_lists(lists)
    values = []
    lists.each do |list|
        while list
            values << list.val
            list = list.next
        end
    end
    # sort! is inplace sorting
    values.sort!
    head = dummy = ListNode.new(val: 0, _next: nil)
    values.each do |value|
        head.next = ListNode.new(value)
        head = head.next
    end
    dummy.next
end