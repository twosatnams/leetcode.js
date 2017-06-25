class MinHeap:

	def __init__(self):
		self.elements = []

	def insert(self, value):
		target_idx = len(self.elements)
		self.elements.append(value)

		parent_idx = self.get_parent_idx(target_idx)
		while self.elements[parent_idx] > self.elements[target_idx]:
			# swap new element and parent
			temp = self.elements[parent_idx]
			self.elements[parent_idx] = self.elements[target_idx]
			self.elements[target_idx] = temp
			parent_idx = self.get_parent_idx(parent_idx)
			target_idx = parent_idx

	def get_min(self):
		return self.elements[0]

	def extract_min(self):
		

	def get_parent_idx(self, child_idx):
		# children are located at 2p and 2p + 1. Where p is not the idx but the position
		child_location = child_idx + 1
		if child_location % 2 == 0:
			return max(int((child_location/2) - 1), 0)
		else:
			return max(int(((child_location - 1)/2) - 1), 0)

	def get_children_idx(self, parent_idx):
		# children are located at 2p and 2p + 1. Where p is not the idx but the position
		return [2*(parent_idx + 1), 2*(parent_idx + 1) + 1]

