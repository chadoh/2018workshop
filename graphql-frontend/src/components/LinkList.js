import React from 'react'
import { graphql } from 'react-apollo'
import gql from 'graphql-tag'
import Link from './Link'

const updateCacheAfterVote = (store, createdVote, linkId) => {
  const data = store.readQuery({ query: FEED_QUERY })

  const votedLink = data.feed.links.find(link => link.id === linkId)
  votedLink.votes = createdVote.link.votes

  store.writeQuery({ query: FEED_QUERY, data })
}

let LinkList = ({feedQuery}) => {
  if (feedQuery && feedQuery.loading) {
    return <div>Loading</div>
  }

  if (feedQuery && feedQuery.error) {
    return <div>Error: {feedQuery.error}</div>
  }

  const linksToRender = feedQuery.feed.links

  return linksToRender.map((link, index) => (
    <Link
      key={link.id}
      link={link}
      index={index}
      updateStoreAfterVote={updateCacheAfterVote}
    />
  ))
}

export const FEED_QUERY = gql`
  query FeedQuery {
    feed {
      links {
        id
        createdAt
        url
        description
        postedBy {
          id
          name
        }
        votes {
          id
          user {
            id
          }
        }
      }
    }
  }
`

export default graphql(FEED_QUERY, { name: 'feedQuery' })(LinkList)
