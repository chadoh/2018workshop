import React from 'react'
import { graphql } from 'react-apollo'
import gql from 'graphql-tag'
import Link from './Link'

const Links = feedQuery => {
  if (feedQuery && feedQuery.loading) {
    return <div>Loading</div>
  }

  if (feedQuery && feedQuery.error) {
    return <div>Error: {feedQuery.error}</div>
  }

  const linksToRender = feedQuery.feed.links

  return linksToRender.map(link => <Link key={link.id} link={link} />)
}

let LinkList = ({feedQuery}) => {
  return (
    <React.Fragment>
      <h1>Links</h1>
      {Links(feedQuery)}
    </React.Fragment>
  )
}

const FEED_QUERY = gql`
  query FeedQuery {
    feed {
      links {
        id
        createdAt
        url
        description
      }
    }
  }
`

export default graphql(FEED_QUERY, { name: 'feedQuery' })(LinkList)
