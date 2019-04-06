FROM alpine:latest

LABEL name="Filter by Event Payload"
LABEL version="0.1.0"
LABEL repository="http://github.com/mika-f/action-filter-by-event-payload"
LABEL homepage="http://github.com/mika-f/action-filter-by-event-payload"
LABEL maintainer="Fuyuno Mikazuki <mikazuki_fuyuno@outlook.com>"

LABEL com.github.actions.name="Filter by Event Payload"
LABEL com.github.actions.description="GitHub Action that filter by event payload"
LABEL com.github.actions.icon="filter"
LABEL com.github.actions.color="gray-dark"

RUN apk add jq

COPY "./bin" "/usr/local/bin"
COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
