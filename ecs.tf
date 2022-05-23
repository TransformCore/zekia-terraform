resource "aws_ecs_cluster" "main" {
  name = "${local.project}-cluster-${var.environment}"
}

resource "aws_ecs_cluster_capacity_providers" "main" {
  cluster_name       = aws_ecs_cluster.main.name
  capacity_providers = ["FARGATE"]
}

resource "aws_ecs_task_definition" "main" {
  family                   = "${local.project}-task-${var.environment}"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.container_cpu
  memory                   = var.container_memory
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = local.container_name
      image     = "${var.container_image}:${var.container_image_tag}"
      cpu       = var.container_cpu
      memory    = var.container_memory
      essential = true
      # environment = [var.container_envs]
      portMappings = [{
        protocol      = "tcp"
        containerPort = var.container_port
        hostPort      = var.container_port
      }]
    }
  ])
}

resource "aws_ecs_service" "main" {
  name            = "${local.project}-service-${var.environment}"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.main.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE" # therefore scheduling_strategy is REPLICA by default

  network_configuration {
    security_groups  = [aws_security_group.ecs_tasks.id]
    subnets          = module.vpc.private_subnets
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.main.arn
    container_name   = local.container_name
    container_port   = var.container_port
  }

  # We can ignore task definition as revision changes happen on deploy
  # and desired count will change based on the autoscaling policy
  lifecycle {
    ignore_changes = [task_definition, desired_count]
  }

  depends_on = [
    aws_iam_role_policy_attachment.ecs_task_execution_role,
    aws_lb_listener.http,
    aws_lb_listener.https
  ]
}
