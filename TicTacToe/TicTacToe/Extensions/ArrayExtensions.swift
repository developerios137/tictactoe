import Foundation

extension Array where Element: Collection {
	public subscript(column column: Element.Index) -> [Element.Iterator.Element] {
		map { $0[column] }
	}
}
