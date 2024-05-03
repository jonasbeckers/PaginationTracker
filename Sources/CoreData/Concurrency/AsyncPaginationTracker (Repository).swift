//
// PaginationTracker
// Copyright © 2023 Wisemen
//

import Foundation
import StatefulUI

@available(iOS 13, *)
public extension AsyncPaginationTrackerWithContext {
	convenience init<Repository: AsyncPaginatedListRepository>(
		repository: Repository,
		statefulController: StatefulViewController? = nil,
		delegate: AsyncPaginationTrackerDelegate? = nil,
		pageSize: Int = 10
	) where Page == Repository.PageType, ContextObject == Repository.PaginationContextObject {
		self.init(
			nextPageCall: repository.loadNextPage,
			contextObject: repository.paginationContextObject,
			statefulController: statefulController,
			delegate: delegate,
			pageSize: pageSize
		)
	}
}

@available(iOS 13, *)
public extension AsyncPaginationTrackerWithContext where ContextObject == Void {
	convenience init<Repository: AsyncPaginatedListRepository>(
		repository: Repository,
		statefulController: StatefulViewController? = nil,
		delegate: AsyncPaginationTrackerDelegate? = nil,
		pageSize: Int = 10
	) where Page == Repository.PageType, Repository.PaginationContextObject == Void {
		self.init(
			nextPageCall: repository.loadNextPage,
			statefulController: statefulController,
			delegate: delegate,
			pageSize: pageSize
		)
	}
}
